local class = {
  math = {
    code_name = "math",
    name = "Math 1",
    
    minors = {
            
    }, -- every minor grade (exclude dropped grades)
    
    majors = {
    
    }, -- every major grade (exclude dropped grades)
  },
  
  ela = {
    code_name = "ela",
    name = "ELA",
        
    minors = {
    
    }, -- every minor grade (exclude dropped grades)
    
    majors = {
    
    }, -- every major grade (exclude dropped grades)
  },
  
  science = {
    code_name = "science",
    name = "Science",
            
    minors = {
    
    }, -- every minor grade (exclude dropped grades)
    
    majors = {
      
    }, -- every major grade (exclude dropped grades)
  },
  
  social_studies = {
    code_name = "social_studies",
    name = "Social Studies",
            
    minors = {
    
    }, -- every minor grade (exclude dropped grades)
    
    majors = {
    
    }, -- every major grade (exclude dropped grades)
  }, -- could also be history class to replace social_studies
  
  elective1 = {
    code_name = "elective1",
    name = "Physical Education",
            
    minors = {
    
    }, -- every minor grade (exclude dropped grades)
    
    majors = {
    
    }, -- every major grade (exclude dropped grades)
  },
  
  elective2 = {
    code_name = "elective2",
    name = "Soccer Club",
            
    minors = {
    
    }, -- every minor grade (exclude dropped grades)
    
    majors = {
    
    }, -- every major grade (exclude dropped grades)
  },
}
local class_grades = {
  math = {
    minor = "0",
    major = "0",
    total = "0",
    letter = "F-",
  },
  
  ela = {
    minor = "0",
    major = "0",
    total = "0",
    letter = "F-",
  },
  
  science = {
    minor = "0",
    major = "0",
    total = "0",
    letter = "F-",
  },
  
  social_studies = {
    minor = "0",
    major = "0",
    total = "0",
    letter = "F-",
  }, -- could also be history class to replace social_studies
  
  elective1 = {
    minor = "0",
    major = "0",
    total = "0",
    letter = "F-",
  },
  
  elective2 = {
    minor = "0",
    major = "0",
    total = "0",
    letter = "F-",
  },
}

local MAJOR_WEIGHT = 0.6 -- percentage of grade
local MINOR_WEIGHT = 0.4 -- percentage of grade

local A_Grade = 90
local B_Grade = 80
local C_Grade = 70
local D_Grade = 60
local F_Grade = 50

local A_Base_Grade = 94
local B_Base_Grade = 84
local C_Base_Grade = 74
local D_Base_Grade = 64
local F_Base_Grade = 30

local A_Plus_Grade = 97
local B_Plus_Grade = 87
local C_Plus_Grade = 77
local D_Plus_Grade = 67
local F_Plus_Grade = 31

local A_Minus_Grade = 93
local B_Minus_Grade = 83
local C_Minus_Grade = 73
local D_Minus_Grade = 63
local F_Minus_Grade = 29

function minors_grade(tabl)
  if tabl then
    local total_minor_count = #tabl
    local total_minor_added = 0
    local count = 0
    
    for i,v in pairs(tabl) do
      total_minor_added = v + total_minor_added
      
      if i == total_minor_count and total_minor_count ~= 0 then
        local min_grade = total_minor_added/total_minor_count
        return min_grade
      elseif total_minor_count == 0 then
        local min_grade = nil
        return min_grade
      end
    end
  end
end

function majors_grade(tabl)
  if tabl ~= nil then
    local total_major_count = #tabl
    local total_major_added = 0
    local count = 0
    
    for i,v in pairs(tabl) do
      total_major_added = v + total_major_added
      
      if i == total_major_count and total_major_count ~= 0 then
        local maj_grade = total_major_added/total_major_count
        return maj_grade
      elseif total_major_count == 0 then
        local maj_grade = nil
        return maj_grade
      end
    end
  elseif tabl == nil then
    local maj_grade = nil
    return maj_grade
  end
end

function total_grades(major, minor)
  if major ~= nil and minor ~= nil then
    local maj_g = major * MAJOR_WEIGHT
    local min_g = minor * MINOR_WEIGHT
    
    local tot_grade = maj_g + min_g
    return tot_grade
    
  elseif major == nil then
    
    local tot_grade = minor
    return tot_grade
    
  elseif minor == nil then
    
    local tot_grade = major
    return tot_grade
    
  end
end

function grade_lettr(grade, plus_minus)
  if grade and plus_minus then
    if plus_minus == true then
      if grade >= A_Grade then
        if grade >= A_Plus_Grade then
          return "A+"
        elseif grade >= A_Base_Grade then
          return "A"
        elseif grade <= A_Minus_Grade then
          return "A-"
        end
      elseif grade >= B_Grade then
        if grade >= B_Plus_Grade then
          return "B+"
        elseif grade >= B_Base_Grade then
          return "B"
        elseif grade <= B_Minus_Grade then
          return "B-"
        end
      elseif grade >= C_Grade then
        if grade >= C_Plus_Grade then
          return "C+"
        elseif grade >= C_Base_Grade then
          return "C"
        elseif grade <= C_Minus_Grade then
          return "C-"
        end
      elseif grade >= D_Grade then
        if grade >= D_Plus_Grade then
          return "D+"
        elseif grade >= D_Base_Grade then
          return "D"
        elseif grade <= D_Minus_Grade then
          return "D-"
        end
      elseif grade <= F_Grade then
        if grade >= F_Plus_Grade then
          return "F+"
        elseif grade >= F_Base_Grade then
          return "F"
        elseif grade <= F_Minus_Grade then
          return "F-"
        end
      else
        return "Not A Letter Grade. (NaN or nil)"
      end
    else
      if grade >= A_Grade then
        return "A"
      elseif grade >= B_Grade then
        return "B"
      elseif grade >= C_Grade then
        return "C"
      elseif grade >= D_Grade then
        return "D"
      elseif grade >= F_Grade then
      return "F"
      else
        return "Not A Letter Grade. (NaN or nil)"
      end
    end
  end
end
  
for count, val in pairs(class) do
  local table = val["code_name"] -- be sure all classes have code_name variable
  
  local grade_minor = minors_grade(class[table]["minors"])
  local grade_major = majors_grade(class[table]["majors"])
  
  local total_grade = total_grades(grade_major, grade_minor)
  local grade_letter = grade_lettr(total_grade, true)
  
  class_grades[table]["minors"] = grade_minor
  class_grades[table]["majors"] = grade_major
  
  class_grades[table]["total"] = total_grade
  class_grades[table]["letter"] = grade_letter
  
  -- print(class_grades[table]["letter"])
  -- print(class_grades[table]["total"])
  -- print(class_grades[table]["majors"])
  -- print(class_grades[table]["minors"])
end
  
  --[[
  LIST OF CLASSES (to swap math with)
  
  math
  science
  ela
  social_studies (or history if changed)
  elective1
  elective2
  
  ]]-- list of classes
  
-- local grade_minor = 100 -- set grade on scale of 0-100
-- local grade_major = 100 -- set grade on scale of 0-100

print("-----------MINORS--GRADE------------")
print()

for count, val in pairs(class) do
  local table = val["code_name"] -- be sure all classes have code_name variable
  local name = val["name"]
  
  if class_grades[table]["minors"] ~= nil then
    
    print(tostring(class_grades[table]["minors"].. " - " ..name))
    
  elseif class_grades[table]["minors"] == nil then
    
    print("unknown (no data to go off of) - " ..name)
    
  end
end

print()
print("-----------MAJORS--GRADE------------")
print()

for count, val in pairs(class) do
  local table = val["code_name"] -- be sure all classes have code_name variable
  local name = val["name"]
  
  if class_grades[table]["majors"] ~= nil then
    
    print(tostring(class_grades[table]["majors"].. " - " ..name))
    
  elseif class_grades[table]["majors"] == nil then
    
    print("unknown (no data to go off of) - " ..name)
    
  end
end

print()
print("-----------TOTAL--GRADE------------")
print()

for count, val in pairs(class) do
  local table = val["code_name"] -- be sure all classes have code_name variable
  local name = val["name"]
  
  if class_grades[table]["total"] ~= nil then
    
    print(tostring(class_grades[table]["total"].. " - " ..name))
    
  elseif class_grades[table]["total"] == nil then
    
    print("unknown (no data to go off of) - " ..name)
    
  end
end

print()
print("-----------LETTER--GRADE------------")
print()

for count, val in pairs(class) do
  local table = val["code_name"] -- be sure all classes have code_name variable
  local name = val["name"]
  
  if class_grades[table]["letter"] ~= nil then
    
    print(tostring(class_grades[table]["letter"].. " - " ..name))
    
  elseif class_grades[table]["letter"] == nil then
    
    print("unknown (no data to go off of) - " ..name)
    
  end
end














